class Cab
  
  attr_accessor :on_duty, :empty, :hailed, :hailed_by, :status, :destination, :meter
  
  def initialize
    self.on_duty = true
    self.empty = true
    self.hailed = false
    self.status = "driving"
    self.destination = "none"
    self.meter = "off"
  end
  
  alias on_duty? on_duty
  alias empty? empty
  alias hailed? hailed
 
  def hailed
    self.status = "pulled over"
  end
  
  def occupied
    self.status = "occupied"
  end

  def accepts_destination
    
    self.destination = "accepted"
  end
  
  def turn_on_meter
   if self.destination == "accepted"
      self.meter = "on" 
    end 
  end
  
  def proceed_to_destination
    self.destination = "set"
    self.empty = "false"
  end
    
  def arrives
    self.destination = "arrived"
  end
  
  def exits
    self.status = "empty"
  end
  
  def thank_you
    "Thank You"
  end
end
    