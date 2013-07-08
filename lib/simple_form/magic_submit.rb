require "simple_form/magic_submit/version"

module SimpleForm
  module MagicSubmit

    def magic_submit_button(*args, &block)
      options = args.extract_options!
      options[:data] ||= {}
      options[:data][:disable_with] ||= translate_key(:disable_with)
      options[:class] = [main_class(options), 'btn-submit', options[:class]].compact
      options[:id] ||= "submit_#{object_scope}"
      options[:autocomplete] ||= :off
      args << options
      if cancel = options.delete(:cancel)
        I18n.t("simple_form.magic_submit.cancel.format",
          submit_button: submit(translate_key, *args, &block).html_safe,
          cancel_link: template.link_to(I18n.t('simple_form.magic_submit.cancel.cancel').html_safe, cancel)
        )
      else
        submit(translate_key, *args, &block)
      end.html_safe
    end

  private
    def main_class
      options.fetch(:destructive, false) ? 'btn-destructive' : 'btn-primary'
    end
    
    def controller_scope
      template.controller.params[:controller].gsub('/', '.')
    end

    def object_scope
      self.object.class.model_name.i18n_key.to_s
    end

    def translate_key(key = nil)
      key ||= self.object.errors.count > 0 ? :retry : :submit
      I18n.t("simple_form.magic_submit.#{controller_scope}.#{object_scope}.#{lookup_action}.#{key}",
        default: [
          :"simple_form.magic_submit.#{controller_scope}.#{lookup_action}.#{key}",
          :"simple_form.magic_submit.default.#{lookup_action}.#{key}",
          :"helpers.submit.#{lookup_action}"
        ],
        model: self.object.class.model_name.human.titlecase
      ).html_safe
    end

  end
end

SimpleForm::FormBuilder.send :include, SimpleForm::MagicSubmit
I18n.load_path += Dir.glob(File.join(File.dirname(__FILE__), '..', '..', 'locales', '*.{rb,yml}'))
