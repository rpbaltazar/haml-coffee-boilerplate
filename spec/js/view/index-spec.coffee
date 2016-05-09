describe 'index.html', ->

  beforeEach ->
    jasmine.getFixtures().fixturesPath = 'build'
    loadFixtures('index.html')

  it 'should have a <h1> element', ->
    expect($('h1')[0]).toBeInDOM()

  it 'should have a non-empty <h1> element', ->
    expect($('h1')[0]).not.toBeEmpty()

  it 'should have a <p> element', ->
    expect($('p')[0]).toBeInDOM()

  it 'should have a non-empty <p> element', ->
    expect($('p')[0]).not.toBeEmpty()
