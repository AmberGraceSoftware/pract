--!strict

local Types = require(script.Parent.Parent.Types)

local spec: Types.Spec = function(practModule, describe)
    local create: any = require(practModule.create)
    local Symbols: any = require(practModule.Symbols)

    describe('create', function(it)
        it('Should create a CreateInstance element with empty props', function(expect)
            local element = create('Frame')
            expect.equal(Symbols.ElementKinds.CreateInstance, element[Symbols.ElementKind])
            expect.deep_equal({}, element.props)
        end)
        it('Should create a RenderComponent element with empty props', function(expect)
            local element = create(function() end)
            expect.equal(Symbols.ElementKinds.RenderComponent, element[Symbols.ElementKind])
            expect.deep_equal({}, element.props)
        end)
        it('Should accept props', function(expect)
            local element = create('Frame', {foo = 'Fighters'})
            expect.equal(Symbols.ElementKinds.CreateInstance, element[Symbols.ElementKind])
            expect.deep_equal({foo='Fighters'}, element.props)
        end)
        it('Should accept props and children', function(expect)
            local element = create('Frame', {foo = 'Fighters'}, {})
            expect.equal(Symbols.ElementKinds.CreateInstance, element[Symbols.ElementKind])
            expect.deep_equal({foo='Fighters', [Symbols.Children] = {}}, element.props)
        end)
        it('Should accept children without props', function(expect)
            local element = create('Frame', nil, {})
            expect.equal(Symbols.ElementKinds.CreateInstance, element[Symbols.ElementKind])
            expect.deep_equal({[Symbols.Children] = {}}, element.props)
        end)
    end)
end

return spec