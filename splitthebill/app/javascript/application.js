// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import { start } from "@rails/ujs"  // This is necessary for rails-ujs to work
import "bootstrap"
import "@popperjs/core" // Required for tooltips and popovers

start()

  document.addEventListener('DOMContentLoaded', () => {
      const signOutLink = document.getElementById('sign-out-link');
      if (signOutLink) {
        signOutLink.addEventListener('click', function(e) {
          e.preventDefault(); // Prevent the default link behavior (GET request)
          fetch(signOutLink.href, {
            method: 'DELETE',
            headers: {
              'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
            }
          })
          .then(response => {
            if (response.ok) {
              window.location.href = '/'; // Redirect to the root or any other page after sign out
            } else {
              console.error('Sign-out failed');
            }
          })
          .catch(error => console.error('Error signing out:', error));
        });
      }
    });

    


  