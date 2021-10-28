--!strict

local Types = require(script.Parent.Types)
local Symbols = require(script.Parent.Symbols)

local Symbol_ElementKind = Symbols.ElementKind
local Symbol_ContextProvider = Symbols.ElementKinds.ContextProvider
local function withContextProvider(
	providerComponentClosureCB: (
		provide: (string, any) -> (() -> ())
	) -> Types.Component
): Types.Component
	local finalComponent = function(props: Types.PropsArgument): Types.Element
		return {
			[Symbol_ElementKind] = Symbol_ContextProvider,
			makeClosure = providerComponentClosureCB,
			props = props
		}
	end
	
	return finalComponent
end

return withContextProvider