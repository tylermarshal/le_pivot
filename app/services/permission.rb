class Permission
  def initialize(user, controller, action)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def authorized?
    if user.platform_admin?
      return true if controller == "users" && action.in?(["index", "show", "edit", "update", "new", "create"])
      return true if controller == "carts" && action.in?(["index", "destroy", "update", "create"])
      return true if controller == "stores/items" && action.in?(["index", "show"])
      return true if controller == "admin/dashboard" && action == "index"
      return true if controller == "dashboard" && action == "index"
      return true if controller == "admin/stores" && action.in?(["index", "update"])
      return true if controller == "admin/analytics" && action == "index"
      return true if controller == "admin/stores/items" && action.in?(["index", "new", "create", "edit", "update"])
      return true if controller == "main" && action == "index"
      return true if controller == "orders" && action.in?(["index", "show", "update", "new"])
      return true if controller == "items" && action.in?(["index", "show"])
      return true if controller == "stores" && action.in?(["index", "show"])
      return true if controller == "sessions" && action.in?(["create", "new", "destroy"])
      return true if controller == "categories" && action == "show"
    elsif user.store_admin?
      return true if controller == "admin/stores/items" && action.in?(["index", "new", "create", "edit", "update"])
      return true if controller == "categories" && action == "show"
      return true if controller == "carts" && action.in?(["index", "destroy", "update", "create"])
      return true if controller == "users" && action.in?(["index", "show", "edit", "update", "new", "create"])
      return true if controller == "stores/items" && action.in?(["index", "show"])
      return true if controller == "main" && action =="index"
      return true if controller == "items" && action.in?(["index", "show"])
      return true if controller == "stores" && action.in?(["index", "show"])
      return true if controller == "orders" && action.in?(["index", "show", "update", "new"])      
      return true if controller == "sessions" && action.in?(["create", "new", "destroy"])
      return true if controller == "admin/dashboard" && action == "index"
      return true if controller == "dashboard" && action == "index"
      return true if controller == "admin/analytics" && action == "index"
    elsif user.store_manager?
      return true if controller == "admin/stores/items" && action.in?(["index", "new", "create", "edit", "update"])
      return true if controller == "orders" && action.in?(["index", "show", "update"])
      return true if controller == "stores/orders" && action.in?(["index", "show"])
      return true if controller == "categories" && action == "show"
      return true if controller == "users" && action.in?(["index", "show", "edit", "update", "new", "create"])
      return true if controller == "stores/items" && action.in?(["index", "show"])
      return true if controller == "carts" && action.in?(["index", "destroy", "update", "create"])
      return true if controller == "main" && action == "index"
      return true if controller == "stores" && action.in?(["index", "show"])
      return true if controller == "sessions" && action.in?(["create", "new", "destroy"])
      return true if controller == "items" && action.in?(["index", "show"])
    elsif user.registered_user?
      return true if controller == "dashboard" && action == "index"
      return true if controller == "orders" && action.in?(["index", "show", "new"])
      return true if controller == "categories" && action == "show"
      return true if controller == "users" && action.in?(["index", "show", "edit", "update", "new", "create"])
      return true if controller == "carts" && action.in?(["index", "destroy", "update", "create"])
      return true if controller == "main" && action == "index"
      return true if controller == "stores/items" && action.in?(["index", "show"])      
      return true if controller == "stores" && action.in?(["index", "show"])
      return true if controller == "sessions" && action.in?(["create", "new", "destroy"])
      return true if controller == "items" && action.in?(["index", "show"])
    else
      return true if controller == "orders" && action == "new"
      return true if controller == "categories" && action == "show"
      return true if controller == "carts" && action.in?(["index", "destroy", "update", "create"])
      return true if controller == "main" && action == "index"
      return true if controller == "stores" && action.in?(["index", "show"])
      return true if controller == "stores/items" && action.in?(["index", "show"])
      return true if controller == "sessions" && action.in?(["create", "new", "destroy"])
      return true if controller == "items" && action.in?(["index", "show"])
      return true if controller == "users" && action.in?(["create", "new"])
    end
  end

  private

  attr_reader :user, :controller, :action
end
