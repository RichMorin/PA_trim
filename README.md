# PA_trim

This file tree was created to reproduce the [error page shows the wrong file
](https://github.com/phoenixframework/phoenix/issues/3462) bug,
using as little code as possible.

## First Attempt

I created a new Phoenix app, from scratch:

    mix phx.new phx_bug_bug --no-ecto
    mix phx.server

Then, in `app.html.eex`, I added a call to `PhxBugBugWeb.LayoutView.bug()`.
The server presented an error page which showed the correct file.
That is, it did not reproduce the problem.

## Second Attempt

I copied `PA_all` file tree to `PA_trim`, then removed almost all the files.
Then, in `app.html.eex`, I added a call to `PhxBugBugWeb.LayoutView.bug()`:

    <% PhxHttpWeb.LayoutView.bug() %>

The server presented an error page which showed the wrong file.
That is, it did reproduce the problem.

Then, I commented out the buggy call:

    <% # PhxHttpWeb.LayoutView.bug() %>

The server presented the expected "Trim Test" page.
