describe "A suite is just a function", ->
  a = undefined
  it "and so is a spec", ->
    a = true
    expect(a).toBe true
  it "and so is a spec", ->
    a = true
    expect(a).toBe true
