class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_items = Portfolio.new
  end

  def create
    @portfolio_items = Portfolio.new(portfolio_params)
    
    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path notice: 'Portfolio was successfully posted.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_items = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_items = Portfolio.destroy
  end 

  def update
    @portfolio_items = Portfolio.find(params[:id])

     respond_to do |format|
      if @portfolio_items.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path notice: 'Portfolio was successfully posted.' }
      else
        format.html { render :new }
      end
    end
  end



      def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body)
    end
end