def get_attr_names(obj):
    """ Return the attribute names of an object """
    return [v for v in dir(obj) if not v.startswith('__') and not callable(getattr(obj, v))]

def get_method_names(obj):
    """ Return the method names of an object """
    return [v for v in dir(obj) if not v.startswith('__') and callable(getattr(obj, v))]