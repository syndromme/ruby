class WelcomeController < ApplicationController
  def ctrl_hello
    render :text => "I am the controller"
  end

  def hello
    @hello = "Saya dari kontroler loh"
  end
end
