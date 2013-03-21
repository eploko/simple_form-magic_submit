# Magic Submit Button for Simple Form

[![Dependency Status](https://gemnasium.com/eploko/simple_form-magic_submit.png)](https://gemnasium.com/eploko/simple_form-magic_submit)

A smart submit button extension for the Simple Form gem that:

- Displays an alternate title on validation errors.
- Displays a different "Loading..." title depending on whether the model is being created or updated.
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
= f.button :magic_submit, cancel: root_path
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
        = f.button :magic_submit
```

The last one is this gem's magic.

To add a cancel link:

```haml
= simple_form_for(resource) do |f|
    = f.error_notification
    .form-inputs
        = f.input :email, autofocus: true
    .form-actions
        = f.button :magic_submit, cancel: root_path
```

Replace `root_path` with whatever path is relevant for your app.

## Localization

The gem comes bundled with an English translation in [en.yml](https://github.com/eploko/simple_form-magic_submit/blob/master/locales/en.yml):

```yaml
en:
  simple_form:
    magic_submit:
      default:
        new:
          submit: "Create a new %{model}"
          retry: "Try creating once again"
          disable_with: "Creating&#133;"
        edit:
          submit: "Save changes"
          retry: "Try saving once again"
          disable_with: "Saving&#133;"
      cancel:
        format: "%{submit_button} or %{cancel_link}"
        cancel: "Cancel"
```

Simply copy the file to you `config/locales` folder inside your Rails project if you want to change the default strings.

Say, for the title the keys will be looked up in the following order:

1. `simple_form.magic_submit.namespace_name.controller_name.model_name.action.submit`
2. `simple_form.magic_submit.namespace_name.controller_name.action.submit`
3. `simple_form.magic_submit.default.action.submit`
4. `helpers.submit.action`

Say, for a `Admin::UsersController` and a `Roles` model, the following lookups will be
made on the edit action:

1. `simple_form.magic_submit.admin.users.roles.edit.submit`
2. `simple_form.magic_submit.admin.users.edit.submit`
3. `simple_form.magic_submit.default.edit.submit`
4. `helpers.submit.edit`

Each lookup will have `%{model}` interpolated to the name of the model.

## To-do

1. Add tests.
2. Add more translations.
3. You tell me.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
