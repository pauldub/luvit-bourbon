#!/usr/bin/env luvit

exports = {}

exports['test_asserts_ok'] = function(test)
  asserts.ok(true)
  test.done()
end

exports['test_asserts_equal'] = function(test)
  asserts.equals(1, 1)
  test.done()
end

return exports