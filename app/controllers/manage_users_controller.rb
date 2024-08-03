class ManageUsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(email: params['user']['email'], password: params['user']['password'], role: params['user']['role'], name: params['user']['name'], surname: params['user']['surname'], status: params['user']['status']);
        if @user.save
            redirect_to manage_user_path(@user)
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(email: params['user']['email'], password: params['user']['password'], role: params['user']['role'], name: params['user']['name'], surname: params['user']['surname'], status: params['user']['status']);
        if @user.save
            redirect_to manage_user_path(@user)
        else
            render :new
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to manage_users_path
    end
end
