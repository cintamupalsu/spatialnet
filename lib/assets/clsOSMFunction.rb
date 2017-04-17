class ClsOSMLL
  def initialize
  end
  
  def getWayNode(fileOSM, tagString)
    fOSM=open(fileOSM,"r:UTF-8")
    dm=0
    dn=0
    lat={}
    lon={}
    way={}
    uidcheck={}
    waymode=false
    waystack={}
    c_waystack=0
    tag={}
    
    until fOSM.eof do
      r1Line=fOSM.gets.chomp
      d1Line=r1Line.split(' ')
      id=0
      if d1Line.first=="<node"
        (0..d1Line.count()-1).each do |i|
          d2Line=d1Line[i].split('"')
          if d2Line[0]=="id="; id=d2Line[1].to_i end
          if d2Line[0]=="lat="; lat[id]=d2Line[1].to_f end
          if d2Line[0]=="lon="; lon[id]=d2Line[1].to_f end
        end
      end
      if waymode
        if d1Line.first=="<nd"
          c_waystack+=1
          d2Line=d1Line[1].split('"')
          waystack[c_waystack]=d2Line[1].to_i
        end
        if d1Line.first=="<tag"
          k=""
          v=""
          (1..d1Line.count()-1).each do |j|
            d2Line=d1Line[j].split('"')
            if d2Line.first=="k="; k=d2Line[1].to_s end
            if d2Line.first=="v="; v=d2Line[1].to_s end
          end
          tag[k]=v
        end
      end
      
      if d1Line.first=="<way"
        waymode=true
        waystack.clear()
        tag.clear()
        c_waystack=0
      end
      if d1Line.first=="</way>" && waymode
        waymode=false
        if tag[tagString]!=nil; way,uidcheck=decway(waystack, c_waystack, way, uidcheck) end
        
      end
      
      
    end
    
    fOSM.close()   
    
    uid={}
    uid=getuid(uidcheck,lat)
    lbl={}
    lbl=getlbl(way,uid)
    uid=combineUid(uid,lat,lon)
    return lbl,uid
    
  end
  
  private
  
    def combineUid(uid,lat,lon)
      uid.each do |key, value|
        uid[key]="#{key} #{value} #{lat[value]} #{lon[value]}"
      end
    end
    
    def getlbl(way,uid)
      lbl={}
      (1..way.count).each do |i|
        d1line=way[i].split(' ')
        if lbl[uid.key(d1line[0].to_i)]==nil
          lbl[uid.key(d1line[0].to_i)]="#{uid.key(d1line[1].to_i)}:1 "
        else
          lbl[uid.key(d1line[0].to_i)]+="#{uid.key(d1line[1].to_i)}:1 "
        end
        if lbl[uid.key(d1line[1].to_i)]==nil
          lbl[uid.key(d1line[1].to_i)]="#{uid.key(d1line[0].to_i)}:1 "
        else
          lbl[uid.key(d1line[1].to_i)]+="#{uid.key(d1line[0].to_i)}:1 "
        end
      end
      lbl.each do |key, value|
        d1line=value.split(' ')
        lbl[key]="#{d1line.count} #{lbl[key]}1 1"
      end
      return lbl
    end
    
    def decway(waystack, c_waystack, way, uidcheck)
      way_c=way.count()
      (1..c_waystack).each do |i|
        uidcheck[waystack[i]]=1
        if i>1
          way_c+=1
          way[way_c]="#{waystack[i-1]} #{waystack[i]}"
          
        end
      end
      
      return way, uidcheck
    end
    
    def getuid(uidcheck, lat)
      uid={}
      c_uid=0
      lat.each do |key, value|
        if uidcheck[key]==1
          c_uid+=1
          uid[c_uid]=key
        end
      end
      return uid
    end
  
end