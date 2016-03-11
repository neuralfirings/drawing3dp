import bpy
import sys

argv = sys.argv
argv = argv[argv.index("--") + 1:]  # get all args after "--"
filename=argv[0] #"nyl"
filepath=argv[1]
filepath=filepath.replace("/", "//")
filepath=filepath + "//" + filename
width=float(argv[2]) #"nyl"
extrude=float(argv[3]) #"nyl"


# filepath="//Users//nyl//git_projects//simplepopper//" + filename
target_dimension_x = width

bpy.ops.import_curve.svg(filepath=filepath+"//"+filename+".svg")
curve_name = bpy.data.objects[0].name
bpy.context.scene.objects.active=bpy.data.objects[curve_name] 
bpy.data.objects[curve_name].select=True
bpy.ops.object.select_all(action='SELECT')
bpy.ops.object.join()

orig_dimension = bpy.data.objects[0].dimensions.x
scale_factor = target_dimension_x/.282 #orig_dimension

bpy.ops.transform.resize(value=(scale_factor,scale_factor,scale_factor), constraint_axis=(False, False, False), constraint_orientation='GLOBAL', mirror=False, proportional='DISABLED', proportional_edit_falloff='ROOT', proportional_size=13.11)
bpy.ops.object.convert(target='MESH')
bpy.ops.object.mode_set(mode='EDIT')
bpy.ops.mesh.select_all(action='SELECT')

bpy.ops.mesh.extrude_region_move(MESH_OT_extrude_region={"mirror":False}, TRANSFORM_OT_translate={"value":(0, 0, extrude), "constraint_axis":(False, False, True), "constraint_orientation":'NORMAL', "mirror":False, "proportional":'DISABLED', "proportional_edit_falloff":'ROOT', "proportional_size":13.11, "snap":False, "snap_target":'CLOSEST', "snap_point":(0, 0, 0), "snap_align":False, "snap_normal":(0, 0, 0), "gpencil_strokes":False, "texture_space":False, "remove_on_cancel":False, "release_confirm":False})
bpy.ops.object.mode_set(mode='OBJECT')

bpy.ops.object.transform_apply(location=True, rotation=True, scale=True)


bpy.ops.export_mesh.stl(filepath=filepath+"//"+filename+".stl", check_existing=True, axis_forward='Y', axis_up='Z', filter_glob="*.stl", global_scale=1, use_scene_unit=False, ascii=False, use_mesh_modifiers=True)