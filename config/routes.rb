Rails.application.routes.draw do

   root 'homes#top'
   resources :books
   get 'books' => 'books#index'
   delete 'books/:id' => 'books#destroy', as: 'destroy_book'
   
   get 'books/:id' => 'books#show',as: 'show_book'
   
   get 'books/:id/edit' => 'books#edit', as: 'edit_books'
   patch 'books/:id' => 'books#update', as: 'update_book'
 
end
 # For details on the DSL available within this file, see 272fffb34fe247158eab6a43204b48a5.vfs.cloud9.ap-northeast-1.amazonaws.com
