def get_attr_names(obj):
    return [v for v in dir(obj) if not v.startswith('__') and not v.startswith('_') and not callable(getattr(obj, v))]
def get_method_names(obj):
    return [v for v in dir(obj) if not v.startswith('__') and not v.startswith('_') and callable(getattr(obj, v))]