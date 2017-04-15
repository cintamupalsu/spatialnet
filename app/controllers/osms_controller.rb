require "./lib/assets/clsOSMFunction.rb"
class OsmsController < ApplicationController
  def new
  end
  
  def osmUpload
  end
  
  def osmProceed
    osmFile = params[:upload][:fileOSM]
    fileName = "nodeway.zip"
    clsOSM = ClsOSMLL.new()
    @cVal = clsOSM.getWayNode(osmFile.path)
  end
end
