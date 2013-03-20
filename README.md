# Magic Submit Button for Simple Form

A smart submit button extension for the Simple Form gem that:

- Displays an alternate title on validation errors.
- Displays a different "Loading..." title depending on whether the model is being saved or updated.
- Is optionally postfixed with a "Cancel" link.
- Is fully localizable via the I18n gem.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_form-magic_submit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_form-magic_submit

## Usage

In your view template add it allong the lines of:

```haml
= simple_form_for(resource) do |f|
    = f.error_notification
    .form-inputs
        = f.input :email, autofocus: true
    .form-actions
        = f.button :submit_retry
```

The last one is this gem's magic.

To add a cancel link:

```haml
= simple_form_for(resource) do |f|
    = f.error_notification
    .form-inputs
        = f.input :email, autofocus: true
    .form-actions
        = f.button :submit_retry, cancel: root_path
```

Replace `root_path` with whatever path is relevant for your app.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
