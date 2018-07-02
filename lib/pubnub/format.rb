# Toplevel Pubnub module.
module Pubnub
  input_paths = if ARGV.empty?
                  Dir.glob("#{File.dirname(__FILE__)}/*.in.rb")
                else
                  ARGV
                end.map { |p| File.expand_path p }

  input_paths.each_with_index do |input_path, _i|
    pid = fork do
      require_relative 'init.rb'

      begin
        output_path = input_path.gsub /\.in\.rb$/, '.out.rb'
        input = File.readlines(input_path)

        chunks = []
        line = ''

        until input.empty?
          line += input.shift
          if Pry::Code.complete_expression? line
            chunks << line
            line = ''
          end
        end

        raise unless line.empty?

        chunks.map! { |chunk| [chunk, [chunk.split($INPUT_RECORD_SEPARATOR).size, 1].max] }
        environment = Module.new.send :binding
        evaluate = lambda do |code, line|
          p 'eval'
          eval(code, environment, input_path, line)
        end

        indent = 50

        line_count = 1
        output = ''
        chunks.each do |chunk, lines|
          result = evaluate.call(chunk, line_count)
          if chunk.strip.empty? || chunk =~ /\A *#/
            output << chunk
          else
            pre_lines = chunk.lines.to_a
            last_line = pre_lines.pop
            output << pre_lines.join

            if last_line =~ /\#$/
              output << last_line.gsub(/\#$/, '')
            else
              if last_line.size < indent && result.inspect.size < indent
                output << format("%-#{indent}s %s", last_line.chomp, "# => #{result.inspect}\n")
              else
                output << last_line << "    # => #{result.inspect}\n"
              end
            end
          end
          line_count += lines
        end

        puts "#{input_path}\n -> #{output_path}"
        # puts output
        File.write(output_path, output)
      rescue StandardError => ex
        puts "#{ex} (#{ex.class})\n#{ex.backtrace * "\n"}"
      end
    end

    Process.wait pid
  end
end
