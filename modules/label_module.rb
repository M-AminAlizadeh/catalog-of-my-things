require_relative '../classes/label_class'

module LabelModule
  def create_label
    print 'Label Title: '
    title = gets.chomp

    print 'Label Color: '
    color = gets.chomp

    new_label = Label.new(title, color)

    # Save
    File.open('data/labels.json', 'a') do |file|
      file.puts new_label.to_json
    end

    puts '-----------------------------------'
    puts 'successfully ADDED!!'
    puts '-----------------------------------'
    new_label
  end

  def list_of_labels
    # Load
    if File.exist?('data/labels.json')
      File.open('data/labels.json', 'r').each do |line|
        label_data = JSON.parse(line)
        new_label = Label.new(label_data['title'], label_data['color'])
        puts new_label
        puts '-----------------------------------'
      end
    else
      puts 'There is no label yet!'
    end
  end
end
