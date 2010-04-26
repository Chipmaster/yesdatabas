class UsersController < ApplicationController

  before_filter :login_required

  # GET /users
  # GET /users.xml
  def index
    @users = User.all
    if session[:adminuser]

      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @users }
      end
    else
      redirect_to :action => "show", :id => session[:id].to_s
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    if (session[:id].to_s == params[:id].to_s) || session[:adminuser]
      @user = User.find(params[:id])
      
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @user }
      end
    else
      redirect_to :action => "show", :id => session[:id].to_s
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    if session[:adminuser]
  
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @user }
      end
    else
      redirect_to :action => "show", :id => session[:id].to_s
    end
  end

  def create
    if session[:adminuser]
      @user = User.new(params[:user])
      @user.password = params[:password]
      @user.email = params[:email]
      @user.usertype = params[:usertype]
      @user.save!
      
      respond_to do |format|
        if @user.save
          flash[:notice] = 'User was successfully created.'
          format.html { redirect_to(@user) }
          format.xml  { render :xml => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        end
      end
    else
      redirect_to :action => "show", :id => session[:id].to_s
    end
  end

  # GET /users/1/edit
  def edit
    if (session[:id].to_s == params[:id].to_s) || session[:adminuser]
      @user = User.find(params[:id])
    else
      redirect_to :action => "edit", :id => session[:id].to_s
    end
  end


  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    if session[:adminuser]
      @user = User.find(params[:id])
      @user.destroy
      
      respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
      end
    else
      redirect_to("users/users/"+session[:id].to_s)
    end
  end
end
