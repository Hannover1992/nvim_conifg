local dap = require('dap')

require('dap').set_log_level('DEBUG')

dap.adapters.python = {
  type = 'executable';
  command = '/home/uczen/.local/share/nvim/mason/packages/debugpy/venv/bin/python'; -- Path to the Python executable in the virtual environment
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
	  {
	name = 'pythone debug run',
	    type = 'python';  -- The type here should match the adapter name
	    request = 'launch';
	    program = "${file}";  -- This should point to the file you're debugging
	    pythonPath = function()
	      return '/usr/bin/python3'  -- Again, the path to the Python executable in the virtual environment
	    end;
	  }
  }
