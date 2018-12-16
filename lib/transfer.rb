require 'pry'
class Transfer
  
  attr_accessor :sender , :receiver , :status , :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
   # binding.pry
    self.sender.balance >= @amount && self.status == "open" 
    @sender.valid?
    @receiver.valid?
  end
  
  def execute_transaction
    
    if status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      end
       if @sender.valid? == false || @receiver.valid? == false
       @status = "rejected"
       "Transaction rejected. Please check your account balance."
     end
  end
  
  def reverse_transfer
    if status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
  
end
