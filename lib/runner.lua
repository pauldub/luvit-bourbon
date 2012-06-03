--[[
Copyright 2012 Rackspace

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS-IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--]]

local bourbon = require(__dirname .. '/..')

local fmt = require('string').format

local exports = {}

local function runTestFile(filePath, callback)
  local status, mod = pcall(require, filePath)

  if status ~= true then
    process.stdout:write(fmt('Error loading test module [%s]: %s\n\n', filePath, mod))
    callback()
    return
  end

  process.stdout:write(fmt('Executing test module [%s]\n\n', filePath))
  bourbon.run(nil, mod, function(err, stats)
    process.stdout:write('\n')
    callback(err, stats)
  end)
end

exports.runTestFile = runTestFile
return exports