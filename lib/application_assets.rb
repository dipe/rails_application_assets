ActionView::Helpers::AssetTagHelper.module_eval do

  ApplicationName = Rails.application.class.name.split(/::/).first.downcase
  PrefixRe = %r{^#{Regexp.escape(ApplicationName)}/}
  #
  # "prefix/app.js", "javascript" -> "prefix/javascript/app.js", ""
  #
  def compute_public_path_with_application_assets(source, dir, *args)
    if source.match(PrefixRe)
      s = source.sub(PrefixRe, "#{dir}/")
      d = ApplicationName
    else
      s = source
      d = dir
    end
    compute_public_path_without_application_assets(s, d, *args)
  end

  alias_method_chain :compute_public_path, :application_assets  
end
