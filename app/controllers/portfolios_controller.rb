class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    
    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path notice: 'Portfolio was successfully posted.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

   def destroy
    # Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])

    # Destroy/delete the record. !!!Look back at this for DESTROY vs. DELETE!!!!
    @portfolio_item.delete

    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

     respond_to do |format|
      if @portfolio_items.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path notice: 'Portfolio was successfully posted.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

      def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body)
    end
end