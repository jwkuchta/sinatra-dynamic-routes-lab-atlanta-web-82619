require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!

  #accepts a name and renders the name backwards
  get '/reversename/:name' do
    @name = params[:name]
    @name = @name.reverse
    "#{@name}"
  end
  
  #accepts a number and returns the square of that number.
  get '/square/:number' do
    @number = params[:number]
    @squared = @number.to_i * @number.to_i
    "#{@squared}"
  end

  #accepts a number and a phrase and returns that phrase in a string the number of times given.
  get '/say/:number/:phrase' do 
    @number = params[:number].to_i
    @phrase = params[:phrase]
    result = ""
    @number.times do 
      result += "#{@phrase}"
    end
    result
  end

  #accepts five words and returns a string containing all five words (i.e. word1 word2 word3 word4 word5).
  get '/say/:word1/:word2/:word3/:word4/:word5' do 
    @word1 = params[:word1]
    @word2 = params[:word2]
    @word3 = params[:word3]
    @word4 = params[:word4]
    @word5 = params[:word5]
    "#{@word1} #{@word2} #{@word3} #{@word4} #{@word5}."
  end

  #accepts an operation (add, subtract, multiply or divide) and performs the operation 
  #on the two numbers provided. For example, going to /add/1/2 should render 3.
  get '/:operation/:number1/:number2' do 
    @operation = params[:operation]
    @num1 = params[:number1]
    @num2 = params[:number2]

    if @operation == "add"
      @sum = @num1.to_i + @num2.to_i
      "#{@sum}"
    elsif @operation == "subtract"
      @subtr = @num1.to_i - @num2.to_i
      "#{@subtr}"
    elsif @operation == "multiply"
      @mult = @num1.to_i * @num2.to_i
      "#{@mult}"
    elsif @operation == "divide"
      @div = @num1.to_i / @num2.to_i
      "#{@div}"
    end
  end
end