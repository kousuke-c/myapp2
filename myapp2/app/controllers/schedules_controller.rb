class SchedulesController < ApplicationController
  def index
   @plan=Plan.all#planテーブルのデータ取得
   
  end
  
  def new
     @plan = Plan.new
    
  end
  
    def create
      require'date'
      @plan = Plan.new(plan_params)
      @plan.save
       if @plan.save
         flash[:notice] = "ユーザーを新規登録しました"
         redirect_to "/"
       else
           render "new"
       end
        
    end
    
    def plan_params
        params.permit(:title, :startTime, :endTime,:dayAll,:memo)
        #params.require(:plan)はplan.newで定義しているので不要
        #（もともとplanテーブルに保存されるものとして送信されているので
        #params.require(:plan)と書くとだぶる？）
    end
    
    def show
      @plan = Plan.find(params[:id])
    end
    
    def edit
         @plan = Plan.find(params[:id])
    end 
    
     def update
      @plan = Plan.find(params[:id])
      if @plan.update(params.require(:plan).permit(:title, :startTime,:dayAll, :endTime, :memo))
        flash[:notice] = "「#{@plan.id}番の#{@plan.title}」の情報を更新しました"
        redirect_to "/"
      else
        render "edit"
      end
     end   
    
    def destroy
         @plan = Plan.find(params[:id])
      @plan.destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to "/"
    end
    protect_from_forgery
    
end
