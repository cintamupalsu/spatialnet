require "./lib/assets/clsOSMFunction.rb"
require 'zip'
class OsmsController < ApplicationController
  def new
  end
  
  def osmUpload
  end
  
  def osmProceed
    osmFile = params[:upload][:fileOSM]
    fileName = "lablelist.zip"
    clsOSM = ClsOSMLL.new()
    @cval = {}
    lbl,uid = clsOSM.getWayNode(osmFile.path,"highway")
    temp_File = Tempfile.new(fileName)
    flbl=Tempfile.new('lbl.txt')
    fuid=Tempfile.new('uid.txt')
    flbl.write("#{lbl.count()} #{lbl.count()} 1\n")
    (1..lbl.count()).each do |i|
      flbl.write("#{lbl[i]}\n")
      fuid.write("#{uid[i]}\n")
    end
    flbl.close()
    Zip::File.open(temp_File.path, Zip::File::CREATE) do |zip_file|
         zip_file.add('lbl.txt', flbl.path)
         zip_file.add('uid.txt', fuid.path)         
    end
   # render 'osmProceed'
    zip_data = File.read(temp_File.path)
    send_data(zip_data, :type => 'application/zip', :filename => fileName)
  end
end
