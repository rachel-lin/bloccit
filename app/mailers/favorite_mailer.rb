class FavoriteMailer < ApplicationMailer
  default from: "hello@rachel-lin.com"

    def new_comment(user, post, comment)
 
     # New Headers
     headers["Message-ID"] = "<comments/#{comment.id}@rachel-lin-bloccit.herokuapp.com>"
     headers["In-Reply-To"] = "<post/#{post.id}@rachel-lin-bloccit.herokuapp.com>"
     headers["References"] = "<post/#{post.id}@rachel-lin-bloccit.herokuapp.com>"
 
     @user = user
     @post = post
     @comment = comment
 
     mail(to: user.email, subject: "New comment on #{post.title}")
   end
end
