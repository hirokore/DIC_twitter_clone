module PostsHelper
    def choose_new_create_confirm_or_edit
        if action_name == "new" || action_name == 'create' || action_name == 'confirm'
            confirm_posts_path
        end
    end
end
