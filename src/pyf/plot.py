import ctypes as ct
from importlib.resources import files
import matplotlib.pyplot as plt
import numpy as np


def plot_quadratic(a, b, c, x_min, x_max, N):
    # Load the quadratic shared library and get the
    # calc_quadratic function
    lib_path = str(files(__package__).joinpath('lib/quadratic.so'))
    calc_quadratic = ct.CDLL(lib_path).calc_quadratic
    # Create an empty array to store the result in
    y = np.empty(N, dtype='double')
    # Call the Fortran function
    calc_quadratic(ct.c_double(a),
                   ct.c_double(b),
                   ct.c_double(c),
                   ct.c_double(x_min),
                   ct.c_double(x_max),
                   ct.c_int(N),
                   y.ctypes.data_as(ct.POINTER(ct.c_double)))
    # Plot the quadratic curve
    plt.plot(np.linspace(x_min, x_max, N), y)
    plt.show()