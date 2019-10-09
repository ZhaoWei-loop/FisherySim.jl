module FisherySim

using Distributions
using Rtweedie
using StatsBase
using StatsFuns         # For `logit` and `logistic`; worth it?
using LinearAlgebra
using Random
using PDMats

import Base: rand, +, -, step, sum, getindex, setindex!, size, length, copy
import Rtweedie: Tweedie
import StatsBase: sample, cov
import Distributions: location

include("fisherydomain.jl")
export AbstractFisheryDomain,
       DiscreteFisheryDomain,
       GriddedFisheryDomain,
       size,
       length,
       sample
       ## Don't export:
       ## calculate_distances,
       ## map_symm

include("covkernels.jl")
export AbstractCovarianceKernel,
       ExpCov,
       Matérn32Cov,
       Matern32Cov,
       AR1,
       cov

include("matrixlognormal.jl")
export MatrixLogNormal,
       location

include("domaindistributions.jl")
export DomainDistribution

include("bathymetry.jl")
export BathymetryModel,
       Bathymetry,
       rand

include("pop_dynamics.jl")
export PopulationDynamicsModel,
       PopState,
       Schaefer,
       PellaTomlinson,
       StochasticProduction,
       vecstate,
       step,
       sum,
       setindex!,
       copy

include("movement.jl")
export MovementModel, eqdist, approx_eqdist

include("targeting.jl")
export AbstractTargetingBehavior,
       RandomTargeting,
       FixedTargeting,
       PreferentialTargeting,
       target

include("catchability.jl")
export Catchability

include("vessels.jl")
export Vessel,
       Catch,
       logistic,
       CPUE,
       +, -,
       fish!,
       getindex,
       Fleet,
       vessels

include("simulation.jl")
export simulate

end # module
