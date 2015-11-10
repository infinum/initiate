desc 'Annotate only models'
task :annotate do
  `annotate --exclude tests,fixtures,factories`
end
