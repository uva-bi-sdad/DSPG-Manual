using Documenter
using DSPG_Manual

# @testset "Documentation" begin
    using Documenter, DSPG_Manual

    DocMeta.setdocmeta!(DSPG_Manual,
                       :DocTestSetup,
                       :(using DSPG_Manual, RCall),
                       recursive = true)
    makedocs(sitename = "DSPG Manual",
             modules = [DSPG_Manual],
             pages = [
                 "Home" => "index.md",
                 "Onboarding" => "Onboarding.md",
                 "Infrastructure" => [
                     "GitHub" => joinpath("Infrastructure", "GitHub.md")
                     "Rivanna" => [
                        "Dashboard" => joinpath("Infrastructure", "Rivanna", "Dashboard.md"),
                        "File Explorer" => joinpath("Infrastructure", "Rivanna", "FileExplorer.md"),
                        "Configuration" => joinpath("Infrastructure", "Rivanna", "Config.md"),
                        "Interactive Apps" => joinpath("Infrastructure", "Rivanna", "InteractiveApps.md"),
                        "Database" => joinpath("Infrastructure", "Rivanna", "Database.md"),
                     ]
                 ],
             ],
             source = joinpath(@__DIR__, "..", "docs", "src"),
             build = joinpath(@__DIR__, "..", "docs", "build"),
             )
# end
