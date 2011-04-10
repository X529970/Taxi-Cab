class Customer
  def hails(cab)
    cab.hailed_by = self
    cab.hailed
  end 
  
  def gets_in(cab)
    cab.occupied if cab.status == "pulled over" 
  end
end