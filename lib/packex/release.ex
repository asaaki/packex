defmodule Packex.Release do
  defmacro __using__(_) do
    quote do
      @after_bundle :packex_wrap_it!

      def packex_wrap_it! _ do
        {release, options} = Mix.Tasks.Relex.release
        IO.puts "release is: #{inspect release}"
        IO.puts "options is: #{inspect options}"
        release_name       = Mix.Tasks.Relex.release_info(release, options)
        release_path       = Path.expand(Path.join([ options[:path] || File.cwd!, name(options) ]))
        package_base       = (options[:path] && Path.expand(options[:path])) || File.cwd!
        path               = Path.relative_to(release_path, package_base)

        Packex.Release.wrap_release release_name, package_base, path
      end

    end
  end

  def wrap_release release_name, package_base, path do
    archive = "#{release_name}.tar.gz"
    Mix.shell.info "Bundling release #{release_name} into #{archive} ..."
    System.cmd "tar czvf #{archive} -C #{package_base} #{path}"
    Mix.shell.info "- done."
  end
end
