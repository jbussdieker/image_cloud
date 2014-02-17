task :upload => [:environment] do
  upload_dir = ENV["UPLOAD_DIR"] || raise("Must specify UPLOAD_DIR")

  Dir.glob(File.join(upload_dir,'*')).each do |upload_path|
    if File.basename(upload_path)[0]!= '.' and !File.directory? upload_path
      puts File.basename(upload_path)

      if File.basename(upload_path).end_with? ".JPG"
        digest = Digest::MD5.file(upload_path)
        md5sum = digest.to_s
        match = Image.find_by(:md5sum => md5sum)
        unless match
          File.open(upload_path) do |f|
            image = Image.new
            image.image = f
            image.name = File.basename(upload_path)
            image.save
            puts " * Uploaded"
          end
        else
          puts " * Duplicate"
        end
      else
        puts " * Bad format"
      end
    end
  end
end
