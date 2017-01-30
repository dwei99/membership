class GroupsController < ApplicationController
  def index
    @user = User.find_by_id(session[:id])
    @groups = Group.all
  end

  def show
   @group = Group.find_by_id(params[:id])
   @members = Member.find_by_group_id(@group)
   puts "*******"
   puts @members.user.first_name
   puts "*******"
  end

  def create
    user = User.find_by_id(session[:id])
    group = Group.create(name:params[:org_name],description:params[:org_desc], user:user)
    members = Member.create(group:group,user:user)
    if !group.errors.blank?
      puts "********"
      puts group.errors.messages
      puts "********"
      flash[:errors] = group.errors.messages
      return redirect_to '/groups'
    end
    return redirect_to '/groups'
  end

  def join
    user = User.find_by_id(params[:user_id])
    group = Group.find_by_id(params[:group_id])
    member = Member.create(group:group,user:user)
    if !member.errors.blank?
      flash[:errors] = member.errors.messages
      redirect_to '/groups'
    end
    return redirect_to '/groups'
  end

  def leave
    user = User.find_by_id(params[:user_id])
    group = Group.find_by_id(params[:group_id])
    member = Member.where(group:group,user:user)
    Member.destroy(member)
    redirect_to '/groups'
  end

  def delete
  end
end
