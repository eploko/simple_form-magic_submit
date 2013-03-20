# Magic Submit Button for Simple Form

A smart submit button extension for the Simple Form gem that:

- Displays an alternate title on validation errors.
- Displays a different "Loading..." title depending on whether the model is being saved or updated.
- Is optionally postfixed with a "Cancel" link.
- Is fully localizable via the I18n gem.

## A picture's worth a thousand words, right?

For a newly created model object, typically in a `new.html.haml`:

<img src="https://raw.github.com/eploko/simple_form-magic_submit/master/preview/01-submit.png" width="720" height="190" alt="A preview of the submit button in the simples case."/>

Add a cancel link:

<img src="https://raw.github.com/eploko/simple_form-magic_submit/master/preview/02-submit-with-cancel.png" width="720" height="190" alt="A preview of the submit button accompanied by a Cancel link."/>

When something goes wrong and the model fails validation:

<img src="https://raw.github.com/eploko/simple_form-magic_submit/master/preview/03-model-invalid.png" width="720" height="260" alt="A preview of the submit button with a different title when the validation has failed."/>

And all this and a bit more with just a single line of code:

```haml
= f.button :submit_retry, cancel: root_path
```

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
