import os

import vim
import colormath
import colormath.color_diff
from colormath.color_objects import LabColor, sRGBColor, HSVColor
from colormath.color_conversions import convert_color
import sys
import math

xterm_tbl = {
    "000000": "016",
    "00005f": "017",
    "000087": "018",
    "0000af": "019",
    "0000d7": "020",
    "0000ff": "021",
    "005f00": "022",
    "005f5f": "023",
    "005f87": "024",
    "005faf": "025",
    "005fd7": "026",
    "005fff": "027",
    "008700": "028",
    "00875f": "029",
    "008787": "030",
    "0087af": "031",
    "0087d7": "032",
    "0087ff": "033",
    "00af00": "034",
    "00af5f": "035",
    "00af87": "036",
    "00afaf": "037",
    "00afd7": "038",
    "00afff": "039",
    "00d700": "040",
    "00d75f": "041",
    "00d787": "042",
    "00d7af": "043",
    "00d7d7": "044",
    "00d7ff": "045",
    "00ff00": "046",
    "00ff5f": "047",
    "00ff87": "048",
    "00ffaf": "049",
    "00ffd7": "050",
    "00ffff": "051",
    "5fff00": "082",
    "5fff5f": "083",
    "5fff87": "084",
    "5fffaf": "085",
    "5fffd7": "086",
    "5fffff": "087",
    "5fd700": "076",
    "5fd75f": "077",
    "5fd787": "078",
    "5fd7af": "079",
    "5fd7d7": "080",
    "5fd7ff": "081",
    "5faf00": "070",
    "5faf5f": "071",
    "5faf87": "072",
    "5fafaf": "073",
    "5fafd7": "074",
    "5fafff": "075",
    "5f8700": "064",
    "5f875f": "065",
    "5f8787": "066",
    "5f87af": "067",
    "5f87d7": "068",
    "5f87ff": "069",
    "5f5f00": "058",
    "5f5f5f": "059",
    "5f5f87": "060",
    "5f5faf": "061",
    "5f5fd7": "062",
    "5f5fff": "063",
    "5f0000": "052",
    "5f005f": "053",
    "5f0087": "054",
    "5f00af": "055",
    "5f00d7": "056",
    "5f00ff": "057",
    "8700ff": "093",
    "8700d7": "092",
    "8700af": "091",
    "870087": "090",
    "87005f": "089",
    "870000": "088",
    "875fff": "099",
    "875fd7": "098",
    "875faf": "097",
    "875f87": "096",
    "875f5f": "095",
    "875f00": "094",
    "8787ff": "105",
    "8787d7": "104",
    "8787af": "103",
    "878787": "102",
    "87875f": "101",
    "878700": "100",
    "87afff": "111",
    "87afd7": "110",
    "87afaf": "109",
    "87af87": "108",
    "87af5f": "107",
    "87af00": "106",
    "87d7ff": "117",
    "87d7d7": "116",
    "87d7af": "115",
    "87d787": "114",
    "87d75f": "113",
    "87d700": "112",
    "87ffff": "123",
    "87ffd7": "122",
    "87ffaf": "121",
    "87ff87": "120",
    "87ff5f": "119",
    "87ff00": "118",
    "afffff": "159",
    "afffd7": "158",
    "afffaf": "157",
    "afff87": "156",
    "afff5f": "155",
    "afff00": "154",
    "afd7ff": "153",
    "afd7d7": "152",
    "afd7af": "151",
    "afd787": "150",
    "afd75f": "149",
    "afd700": "148",
    "afafff": "147",
    "afafd7": "146",
    "afafaf": "145",
    "afaf87": "144",
    "afaf5f": "143",
    "afaf00": "142",
    "af87ff": "141",
    "af87d7": "140",
    "af87af": "139",
    "af8787": "138",
    "af875f": "137",
    "af8700": "136",
    "af5fff": "135",
    "af5fd7": "134",
    "af5faf": "133",
    "af5f87": "132",
    "af5f5f": "131",
    "af5f00": "130",
    "af00ff": "129",
    "af00d7": "128",
    "af00af": "127",
    "af0087": "126",
    "af005f": "125",
    "af0000": "124",
    "d70000": "160",
    "d7005f": "161",
    "d70087": "162",
    "d700af": "163",
    "d700d7": "164",
    "d700ff": "165",
    "d75f00": "166",
    "d75f5f": "167",
    "d75f87": "168",
    "d75faf": "169",
    "d75fd7": "170",
    "d75fff": "171",
    "d78700": "172",
    "d7875f": "173",
    "d78787": "174",
    "d787af": "175",
    "d787d7": "176",
    "d787ff": "177",
    "dfaf00": "178",
    "dfaf5f": "179",
    "dfaf87": "180",
    "dfafaf": "181",
    "dfafdf": "182",
    "dfafff": "183",
    "dfdf00": "184",
    "dfdf5f": "185",
    "dfdf87": "186",
    "dfdfaf": "187",
    "dfdfdf": "188",
    "dfdfff": "189",
    "dfff00": "190",
    "dfff5f": "191",
    "dfff87": "192",
    "dfffaf": "193",
    "dfffdf": "194",
    "dfffff": "195",
    "ffff00": "226",
    "ffff5f": "227",
    "ffff87": "228",
    "ffffaf": "229",
    "ffffdf": "230",
    "ffffff": "231",
    "ffdf00": "220",
    "ffdf5f": "221",
    "ffdf87": "222",
    "ffdfaf": "223",
    "ffdfdf": "224",
    "ffdfff": "225",
    "ffaf00": "214",
    "ffaf5f": "215",
    "ffaf87": "216",
    "ffafaf": "217",
    "ffafdf": "218",
    "ffafff": "219",
    "ff8700": "208",
    "ff875f": "209",
    "ff8787": "210",
    "ff87af": "211",
    "ff87df": "212",
    "ff87ff": "213",
    "ff5f00": "202",
    "ff5f5f": "203",
    "ff5f87": "204",
    "ff5faf": "205",
    "ff5fdf": "206",
    "ff5fff": "207",
    "ff0000": "196",
    "ff005f": "197",
    "ff0087": "198",
    "ff00af": "199",
    "ff00df": "200",
    "ff00ff": "201",
    "080808": "232",
    "121212": "233",
    "1c1c1c": "234",
    "262626": "235",
    "303030": "236",
    "3a3a3a": "237",
    "444444": "238",
    "4e4e4e": "239",
    "585858": "240",
    "626262": "241",
    "6c6c6c": "242",
    "767676": "243",
    "eeeeee": "255",
    "e4e4e4": "254",
    "dadada": "253",
    "d0d0d0": "252",
    "c6c6c6": "251",
    "bcbcbc": "250",
    "b2b2b2": "249",
    "a8a8a8": "248",
    "9e9e9e": "247",
    "949494": "246",
    "8a8a8a": "245",
    "808080": "244",
    "000000": "000",
    "800000": "001",
    "008000": "002",
    "808000": "003",
    "000080": "004",
    "800080": "005",
    "008080": "006",
    "c0c0c0": "007",
    "808080": "008",
    "ff0000": "009",
    "00ff00": "010",
    "ffff00": "011",
    "0000ff": "012",
    "ff00ff": "013",
    "00ffff": "014",
    "ffffff": "015"
}

xterm_tbl_lab = [(convert_color(sRGBColor.new_from_rgb_hex("#" + k),
                                LabColor), v) for (k, v) in xterm_tbl.items()]


def colors_name_from_file(file):
  basename = os.path.basename(file)
  if basename.endswith(".vim"):
    return basename[:-4]
  return basename


flip_algs = {
        'sqrt': math.sqrt,
        'cbrt': lambda x: math.pow(x, 1/3.),
        '2/3': lambda x: math.pow(x, 2/3.),
        'linear': lambda x: x,
        'log': math.log
}

class Vivid:

  def __init__(self, outfile):
    self.outfilename = outfile
    self.outfile = open(outfile, "w")
    self.params = vim.eval("g:spectral_parameters")
    self.default_bg = self.params.get("default_bg", "dark")
    self.filter_fg = self.params.get("filter_fg",
                                     [[1, 0, 0], [0, 1, 0], [0, 0, 1]])
    self.filter_bg = self.params.get("filter_bg",
                                     [[1, 0, 0], [0, 1, 0], [0, 0, 1]])
    self.flip_algorithm = self.params.get("flip_algorithm", "sqrt")

    self.dark_highlights = []
    self.light_highlights = []
    self.after_highlights = []

  def writeln(self, str):
    self.outfile.write(str + "\n")

  def start(self):
    self.writeln("""
hi clear
if exists('syntax_on')
  syntax reset
endif
" Default BG = """ + self.default_bg + """
" Filter FG = """ + str(self.filter_fg) + """
" Filter BG = """ + str(self.filter_bg) + """
let g:colors_name="%s"
""" % (colors_name_from_file(self.outfilename)))

  def highlight_dark(self, name, fg, bg, sp, extra):
    self._highlight_dark(name, apply_filter(self.filter_fg, fg),
                         apply_filter(self.filter_bg, bg), sp, extra)

  def highlight_light(self, name, fg, bg, sp, extra):
    self._highlight_light(name, apply_filter(self.filter_fg, fg),
                          apply_filter(self.filter_bg, bg), sp, extra)

  def _highlight_dark(self, name, fg, bg, sp, extra):
    self.dark_highlights.append(
        "highlight! %s guifg=%s guibg=%s guisp=%s ctermfg=%s ctermbg=%s %s %s" %
        (name, fg, bg, sp, self.project(fg), self.project(bg),
         to_gui(",".join(extra)), to_cterm(",".join(extra))))

  def _highlight_light(self, name, fg, bg, sp, extra):
    self.light_highlights.append(
        "highlight! %s guifg=%s guibg=%s guisp=%s ctermfg=%s ctermbg=%s %s %s" %
        (name, fg, bg, sp, self.project(fg), self.project(bg),
         to_gui(",".join(extra)), to_cterm(",".join(extra))))

  def highlight_after(self, name, fg, bg, sp, extra):
    self.after_highlights.append(
        "highlight! %s guifg=%s guibg=%s guisp=%s ctermfg=%s ctermbg=%s %s %s" %
        (name, fg, bg, sp, self.project(fg), self.project(bg),
         to_gui(",".join(extra)), to_cterm(",".join(extra))))

  def highlight(self, name, fg, bg, sp, extra):
    if self.default_bg == "light":
      self.highlight_light(name, fg, bg, sp, extra)
      self.highlight_dark(
              name,
              self.flip_brightness(fg),
              self.flip_brightness(bg),
              self.flip_brightness(sp),
              extra)
    else:
      self.highlight_dark(name, fg, bg, sp, extra)
      self.highlight_light(
              name,
              self.flip_brightness(fg),
              self.flip_brightness(bg),
              self.flip_brightness(sp),
              extra)

  def project(self, color_hex):
    if color_hex == "None":
      return "None"

    lab_color = convert_color(sRGBColor.new_from_rgb_hex(color_hex), LabColor)

    min_value = "0"
    min_number = 100000000

    for (k, v) in xterm_tbl_lab:
      number = colormath.color_diff.delta_e_cie2000(k, lab_color)
      if number < min_number:
        min_number = number
        min_value = v

    return min_value

  def finish(self):
    self.writeln("if &bg == 'dark'")
    for l in self.dark_highlights:
      self.writeln(l)
    self.writeln("else")
    for l in self.light_highlights:
      self.writeln(l)
    self.writeln("endif")
    for l in self.after_highlights:
      self.writeln(l)

    self.outfile.flush()
    self.outfile.close()

  def flip_brightness(self, color_hex):
    if color_hex == "None":
      return color_hex

    color = sRGBColor.new_from_rgb_hex(color_hex)
    color_lab = convert_color(color, LabColor)
    (l, a, b) = color_lab.get_value_tuple()

    lf = l / 100.0
    lf = 1 - lf

    lf = flip_algs[self.flip_algorithm](lf)

    new_lab = LabColor(lf * 100, a, b)

    return get_rgb_hex(convert_color(new_lab, sRGBColor))

def spectral_flip_brightness(color_hex):
    c = spectral_ctx.flip_brightness(color_hex)
    vim.command('let g:return="%s"' % c)

def spectral_highlight(name, fg, bg):
  spectral_ctx.highlight(name, fg, bg)


def spectral_start(outfile):
  global spectral_ctx
  spectral_ctx = Vivid(outfile)
  spectral_ctx.start()

def get_saturation(color):
  if isinstance(color, str):
    color = sRGBColor.new_from_rgb_hex(color)

  color_hsv = convert_color(color, HSVColor)
  (h, s, v) = color_hsv.get_value_tuple()
  return s

def spectral_get_saturation(color):
  c = get_saturation(color)
  vim.command('let g:return=%s' % c)

def set_saturation(color, amnt):
  if isinstance(color, str):
    color = sRGBColor.new_from_rgb_hex(color)

  color_hsv = convert_color(color, HSVColor)
  (h, s, v) = color_hsv.get_value_tuple()

  color_hsv = HSVColor(h, amnt, v)
  return convert_color(color_hsv, sRGBColor)

def spectral_set_saturation(color, amnt):
  c = set_saturation(color, amnt)
  vim.command('let g:return="%s"' % get_rgb_hex(c))


def lighter(color, amt):
  if isinstance(color, str):
    color = sRGBColor.new_from_rgb_hex(color)

  color_lab = convert_color(color, LabColor)
  (l, a, b) = color_lab.get_value_tuple()
  new_lab = LabColor(l * amt, a, b)

  return convert_color(new_lab, sRGBColor)


def spectral_lighter(color, amt):
  c = lighter(color, amt)
  vim.command('let g:return="#%02x%02x%02x"' %
              (int(c.clamped_rgb_r * 255), int(
                  c.clamped_rgb_g * 255), int(c.clamped_rgb_b * 255)))


def get_rgb_hex(c):
  # why colormath no clip values?!
  (r, g, b) = c.get_upscaled_value_tuple()
  return "#%02x%02x%02x" % (min(r, 255), min(g, 255), min(b, 255))


def to_gui(s):
  if s:
    return "gui=" + s
  else:
    return ""


def to_cterm(s):
  if s:
    return "cterm=" + s
  else:
    return ""


def spectral_finish():
  spectral_ctx.finish()


def apply_filter(filter, color_hex):
  if color_hex == "None":
    return "None"

  r = int(color_hex[1:3], 16) / 255.
  g = int(color_hex[3:5], 16) / 255.
  b = int(color_hex[5:7], 16) / 255.

  rn = (
      float(filter[0][0]) * r + float(filter[0][1]) * g +
      float(filter[0][2]) * b)

  gn = (
      float(filter[1][0]) * r + float(filter[1][1]) * g +
      float(filter[1][2]) * b)

  bn = (
      float(filter[2][0]) * r + float(filter[2][1]) * g +
      float(filter[2][2]) * b)

  def clip(n):
    return int(max(min(n, 255), 0))

  return "#%02x%02x%02x" % (clip(rn * 255), clip(gn * 255), clip(bn * 255))
