using PVSimBase
using Documenter

DocMeta.setdocmeta!(PVSimBase, :DocTestSetup, :(using PVSimBase); recursive = true)

const page_rename = Dict("developer.md" => "Developer docs") # Without the numbers
const numbered_pages = [
    file for file in readdir(joinpath(@__DIR__, "src")) if
    file != "index.md" && splitext(file)[2] == ".md"
]

makedocs(;
    modules = [PVSimBase],
    authors = "Stefan de Lange <langestefan@msn.com>",
    repo = "https://github.com/PVSMC/PVSimBase.jl/blob/{commit}{path}#{line}",
    sitename = "PVSimBase.jl",
    format = Documenter.HTML(; canonical = "https://PVSMC.github.io/PVSimBase.jl"),
    pages = ["index.md"; numbered_pages],
)

deploydocs(; repo = "github.com/PVSMC/PVSimBase.jl")
