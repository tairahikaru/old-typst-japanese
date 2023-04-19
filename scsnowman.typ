// scsnowman.typ
// https://github.com/tairahikaru/old-typst-japanese
// This file is based on scsnowman.sty (https://github.com/aminophen/scsnowman)
// Copyright notice of scsnowman.sty is as follows:
// > The BSD 2-Clause License
// > Copyright (c) 2015-2023 Hironobu Yamashita
// This file is distributed under The BSD 2-Clause License.
//
// Require Typst 0.2.0 (23/04/11)

#let scsnowman-init = (
  scale: 1,
  body: false, // !
  eyes: true,
  mouth: true,
  nose: false,
  sweat: false,
  arms: false,
  hat: false,
  muffler: false,
  buttons: false,
  snow: false,
  note: false,
  broom: false,
  ///shape: "normal",
  mouthshape: "smile",
  mikan: false,
  leaf: false,
  adjustbaseline: false,
)
#let scsnowman-state = state("scsnowman", scsnowman-init)

#let scsnowman(
  scale: none,
  body: none,
  eyes: none,
  mouth: none,
  nose: none,
  sweat: none,
  arms: none,
  hat: none,
  muffler: none,
  buttons: none,
  snow: none,
  note: none,
  broom: none,
  ///shape: none,
  mouthshape: none,
  mikan: none,
  leaf: none,
  adjustbaseline: none,
) = {locate(loc => {
  let setdefault(key, value) = {
    if value == none {
      return scsnowman-state.at(loc).at(key)
    } else if value == true {
      let v = scsnowman-state.at(loc).at(key)
      if v != false { return v }  else { return true }
    } else {
      return value
    }
  }
  let scale = setdefault("scale", scale)
  let body = setdefault("body", body)
  let eyes = setdefault("eyes", eyes)
  let mouth = setdefault("mouth", mouth)
  let nose = setdefault("nose", nose)
  let sweat = setdefault("sweat", sweat)
  let arms = setdefault("arms", arms)
  let hat = setdefault("hat", hat)
  let muffler = setdefault("muffler", muffler)
  let buttons = setdefault("buttons", buttons)
  let snow = setdefault("snow", snow)
  let note = setdefault("note", note)
  let broom = setdefault("broom", broom)
  let mouthshape = setdefault("mouthshape", mouthshape)
  let mikan = setdefault("mikan", mikan)
  let leaf = setdefault("leaf", leaf)
  let adjustbaseline = setdefault("adjustbaseline", adjustbaseline)

  let H = scale * 1em
  let stroke = 0.01 * H
  box(width: H, height: H, place(dy: if adjustbaseline  {0.08*H} else {0*H}, {
  set place(left+top)

    // body
    place({
      path(
        closed: true,
        stroke: if body == false { stroke + black } else { auto },
        fill: if body == false { none } else if body == true { black } else { body },
        ((0.5*H,0.28*H), (0pt,0pt), (0.14*H,0.00*H)),
        ((0.76*H,0.45*H), (0*H, -0.1*H), (0.00*H,0.04*H)),
        ((0.67*H,0.56*H), (0.07*H, -0.03*H), (0.12*H,0.03*H)),
        ((0.84*H,0.75*H), (0*H, -0.07*H), (0.00*H,0.12*H)),
        ((0.68*H,0.92*H), (0.07*H,0*H), (0pt,0pt)),
        ((0.32*H,0.92*H), (0pt,0pt), (-0.07*H,0.00*H)),
        ((0.16*H,0.75*H), (0*H,0.12*H), (0.00*H,-0.07*H)),
        ((0.33*H,0.56*H), (-0.12*H, 0.03*H), (-0.05*H,-0.03*H)),
        ((0.24*H,0.45*H), (0*H, 0.04*H), (0.00*H,-0.10*H)),
        ((0.5*H,0.28*H), (-0.14*H, 0*H), (0pt,0pt))
      )
    })

    let color(color) = {
      if color == true {
        if body == false {
          return black
        } else {
          return white
        }
      } else {
        return color
      }
    }

    // mouth
    if mouth != false {
      if mouthshape == "smile" {
        place({
          path(
            stroke: stroke + color(mouth),
            ((0.40*H,0.52*H), (0pt,0pt), (0.05*H,0.03*H)),
            ((0.60*H,0.52*H), (-0.05*H,0.03*H), (0pt,0pt)),
          )
        })
      } else if mouthshape == "tight" {
        place({
          path(
            stroke: stroke + color(mouth),
            (0.40*H,0.53*H),
            (0.60*H,0.53*H),
          )
        })
      } else if mouthshape == "frown" {
        place({
          path(
            stroke: stroke + color(mouth),
            ((0.40*H,0.54*H), (0pt,0pt), (0.05*H,-0.03*H)),
            ((0.60*H,0.54*H), (-0.05*H,-0.03*H), (0pt,0pt)),
          )
        })
      } else {
        panic("Unknown mouthshape: ", mouthshape)
      }
    }

    // eyes
    if eyes != false {
      place({
        place(dx: 0.38*H, dy: 0.41*H, ellipse(width: 0.04*H, height: 0.06*H, fill: color(eyes)))
        place(dx: 0.58*H, dy: 0.41*H, ellipse(width: 0.04*H, height: 0.06*H, fill: color(eyes)))
      })
    }

    // sweat
    if sweat != false {
      place({
        path(
          closed: true,
          stroke: stroke + color(sweat),
          ((0.70*H,0.44*H), (0pt,0pt), (-0.06*H,0.10*H)),
          ((0.70*H,0.44*H), (0.05*H,0.10*H), (0pt,0pt)),
          // repeat
          ((0.70*H,0.44*H), (0pt,0pt), (-0.06*H,0.10*H)),
          ((0.70*H,0.44*H), (0.05*H,0.10*H), (0pt,0pt)),
        )
      })
    }

    // nose
    if nose != false {
      place({
        path(
          fill: color(nose),
          stroke: if body == false { auto } else { stroke + white },
          closed: true,
          ((0.49*H,0.50*H), (0*H,0*H), (0.03*H,-0.01*H)),
          ((0.48*H,0.46*H), (0.03*H, 0*H), (-0.02*H,0.00*H)),
          ((0.40*H,0.48*H), (0*H,0*H), (-0.01*H,0.01*H)),
          ((0.49*H,0.50*H), (-0.03*H,0*H), (0*H,0*H)),
          // repeat
          ((0.49*H,0.50*H), (0*H,0*H), (0.03*H,-0.01*H)),
          ((0.48*H,0.46*H), (0.03*H, 0*H), (-0.02*H,0.00*H)),
          ((0.40*H,0.48*H), (0*H,0*H), (-0.01*H,0.01*H)),
          ((0.49*H,0.50*H), (-0.03*H,0*H), (0*H,0*H)),
        )
      })
    }

    let color(color) = {
      if color == true {
        if body == false {
          return black
        } else if body == true {
          return black
        } else {
          return body
        }
      } else {
        return color
      }
    }

    // hat
    if hat != false {
      place({
        path(
          closed: true,
          fill: color(hat),
          (0.58*H,0.10*H),
          (0.77*H,0.19*H),
          ((0.74*H,0.39*H), (0pt,0pt), (-0.08*H,0.01*H)),
          ((0.46*H,0.28*H), (0.04*H, 0.06*H), (0pt,0pt)),
          (0.58*H,0.10*H),
        )
      })
    }

    // mikan
    if mikan != false {
      place({
        place(dx: 0.35*H, dy: 0.08*H, ellipse(width: 0.30*H, height: 0.24*H, fill: color(mikan)))
      })
      // leaf
      if leaf != false {
        place({
          path(
            closed: true,
            fill: color(leaf),
            ((0.5*H,0.07*H), (0*H,0*H), (0.08*H,-0.02*H)),
            ((0.65*H,0.12*H), (-0.07*H,-0.07*H), (-0.15*H,0.01*H)),
            ((0.5*H,0.07*H), (0*H,0.06*H), (0*H,0*H)),
          )
        })
      }
    }

    // muffler
    if muffler != false {
      place({
        path(
          closed: true,
          fill: color(muffler),
          stroke: if body == false { auto } else { stroke + white },
          ((0.27*H,0.52*H), (0*H,0*H), (0.15*H,0.10*H)),
          ((0.73*H,0.52*H), (-0.15*H,0.1*H), (0.02*H,0.02*H)),
          ((0.77*H,0.59*H), (-0.01*H,-0.03*H), (0.00*H,0.02*H)),
          ((0.73*H,0.64*H), (0.02*H,-0.01*H), (0.01*H,0.03*H)),
          ((0.76*H,0.74*H), (-0.02*H,-0.05*H), (-0.01*H,0.01*H)),
          ((0.66*H,0.77*H), (0.06*H,-0.01*H), (0.00*H,-0.04*H)),
          ((0.63*H,0.66*H), (0.02*H,0.04*H), (-0.21*H,0.04*H)),
          ((0.24*H,0.59*H), (0.08*H,0.06*H), (0.01*H,-0.04*H)),
          ((0.27*H,0.52*H), (-0.01*H,0.01*H), (0*H,0*H)),
          // repeat
          ((0.27*H,0.52*H), (0*H,0*H), (0.15*H,0.10*H)),
          ((0.73*H,0.52*H), (-0.15*H,0.1*H), (0.02*H,0.02*H)),
          ((0.77*H,0.59*H), (-0.01*H,-0.03*H), (0.00*H,0.02*H)),
          ((0.73*H,0.64*H), (0.02*H,-0.01*H), (0.01*H,0.03*H)),
          ((0.76*H,0.74*H), (-0.02*H,-0.05*H), (-0.01*H,0.01*H)),
          ((0.66*H,0.77*H), (0.06*H,-0.01*H), (0.00*H,-0.04*H)),
          ((0.63*H,0.66*H), (0.02*H,0.04*H), (-0.21*H,0.04*H)),
          ((0.24*H,0.59*H), (0.08*H,0.06*H), (0.01*H,-0.04*H)),
          ((0.27*H,0.52*H), (-0.01*H,0.01*H), (0*H,0*H)),
        )
      })
    }

    // buttons
    if buttons != false {
      place({
        place(dx: 0.47*H, dy: 0.81*H - if muffler != false { 0*H } else { 0.01*H },
          circle(radius: 0.03*H, fill: color(buttons), stroke: if body == false { auto } else { stroke + white })
        )
        place(dx: 0.47*H, dy: 0.71*H - if muffler != false { 0*H } else { 0.01*H },
          circle(radius: 0.03*H, fill: color(buttons), stroke: if body == false { auto } else { stroke + white })
        )
      })
    }

    // broom
    if broom != false {
      place({
        place(path(stroke: 0.0344444*H + color(broom),
          (0.03*H, 0.94*H), (0.12*H, 0.5*H)
        ))
        place(path(stroke: 0.01291665*H + color(broom),
          (0.11*H, 0.5*H), (0.06*H, 0.25*H)
        ))
        place(path(stroke: 0.01291665*H + color(broom),
          (0.12*H,0.50*H), (0.12*H,0.28*H)
        ))
        place(path(stroke: 0.01291665*H + color(broom),
          (0.12*H,0.50*H), (0.18*H,0.24*H)
        ))
        place(path(stroke: 0.01291665*H + color(broom),
          (0.12*H,0.50*H), (0.21*H,0.30*H)
        ))
        place(path(stroke: 0.01291665*H + color(broom),
          (0.13*H,0.50*H), (0.27*H,0.26*H)
        ))
      })
    }

    // arms
    if arms != false {
      place({
        place(path( // right
          closed: true,
          fill: color(arms),
          stroke: color(arms) + stroke,
          ((0.20*H,0.69*H), (0*H,0*H), (-0.01*H,-0.02*H)),
          ((0.13*H,0.58*H), (0.01*H,0.01*H), (-0.01*H,-0.01*H)),
          ((0.07*H,0.56*H), (0.03*H,0.01*H), (-0.03*H,-0.02*H)),
          ((0.08*H,0.54*H), (-0.02*H,0*H), (0.01*H,0.00*H)),
          ((0.12*H,0.56*H), (-0.01*H,0*H), (0.02*H,-0.02*H)),
          ((0.15*H,0.51*H), (-0.01*H,0.02*H), (0.01*H,-0.02*H)),
          ((0.16*H,0.52*H), (0*H,-0.01*H),  (0.00*H,0.02*H)),
          ((0.15*H,0.57*H), (-0.01*H,-0.01*H), (0.01*H,0.01*H)),
          ((0.22*H,0.67*H), (-0.01*H,-0.02*H), (0.01*H,0.02*H)),
          ((0.20*H,0.69*H), (0.01*H,0.01*H), (0*H,0*H)),
          // repeat
          ((0.20*H,0.69*H), (0*H,0*H), (-0.01*H,-0.02*H)),
          ((0.13*H,0.58*H), (0.01*H,0.01*H), (-0.01*H,-0.01*H)),
          ((0.07*H,0.56*H), (0.03*H,0.01*H), (-0.03*H,-0.02*H)),
          ((0.08*H,0.54*H), (-0.02*H,0*H), (0.01*H,0.00*H)),
          ((0.12*H,0.56*H), (-0.01*H,0*H), (0.02*H,-0.02*H)),
          ((0.15*H,0.51*H), (-0.01*H,0.02*H), (0.01*H,-0.02*H)),
          ((0.16*H,0.52*H), (0*H,-0.01*H),  (0.00*H,0.02*H)),
          ((0.15*H,0.57*H), (-0.01*H,-0.01*H), (0.01*H,0.01*H)),
          ((0.22*H,0.67*H), (-0.01*H,-0.02*H), (0.01*H,0.02*H)),
          ((0.20*H,0.69*H), (0.01*H,0.01*H), (0*H,0*H)),
        ))
        place(path( // left
          closed: true,
          fill: color(arms),
          stroke: color(arms) + stroke,
          ((0.80*H,0.69*H), (0*H,0*H), (0.01*H,-0.02*H)),
          ((0.87*H,0.58*H), (-0.01*H,0.01*H), (0.01*H,-0.01*H)),
          ((0.93*H,0.56*H), (-0.03*H,0.01*H), (0.03*H,-0.02*H)),
          ((0.92*H,0.54*H), (0.02*H,0*H), (-0.01*H,0.00*H)),
          ((0.88*H,0.56*H), (0.01*H,0*H), (-0.02*H,-0.02*H)),
          ((0.85*H,0.51*H), (0.01*H,0.02*H), (-0.01*H,-0.02*H)),
          ((0.84*H,0.52*H), (0*H,-0.01*H), (0.00*H,0.02*H)),
          ((0.85*H,0.57*H), (0.01*H,-0.01*H), (-0.01*H,0.01*H)),
          ((0.78*H,0.67*H), (0.01*H,-0.02*H), (-0.01*H,0.02*H)),
          ((0.80*H,0.69*H), (-0.01*H,0.01*H), (0*H,0*H)),
          // repeat
          ((0.80*H,0.69*H), (0*H,0*H), (0.01*H,-0.02*H)),
          ((0.87*H,0.58*H), (-0.01*H,0.01*H), (0.01*H,-0.01*H)),
          ((0.93*H,0.56*H), (-0.03*H,0.01*H), (0.03*H,-0.02*H)),
          ((0.92*H,0.54*H), (0.02*H,0*H), (-0.01*H,0.00*H)),
          ((0.88*H,0.56*H), (0.01*H,0*H), (-0.02*H,-0.02*H)),
          ((0.85*H,0.51*H), (0.01*H,0.02*H), (-0.01*H,-0.02*H)),
          ((0.84*H,0.52*H), (0*H,-0.01*H), (0.00*H,0.02*H)),
          ((0.85*H,0.57*H), (0.01*H,-0.01*H), (-0.01*H,0.01*H)),
          ((0.78*H,0.67*H), (0.01*H,-0.02*H), (-0.01*H,0.02*H)),
          ((0.80*H,0.69*H), (-0.01*H,0.01*H), (0*H,0*H)),
        ))
      })
    }

    // snow
    if snow != false {
      place({
        set circle(stroke: stroke + color(snow)) if body == false
        set circle(fill: color(snow)) if body != false
        if broom != false {
          place(dx:0.09*H, dy:0.15*H, circle(radius: 0.04*H))
        } else {
          place(dx:0.03*H, dy:0.68*H, circle(radius: 0.04*H))
          place(dx:0.09*H, dy:0.41*H, circle(radius: 0.04*H))
          if note == false {
            place(dx:0.04*H, dy:0.28*H, circle(radius: 0.04*H))
            place(dx:0.19*H, dy:0.22*H, circle(radius: 0.04*H))
          }
        }
        place(dx:0.38*H, dy:0.07*H, circle(radius: 0.04*H))
        place(dx:0.70*H, dy:0.07*H, circle(radius: 0.04*H))
        place(dx:0.84*H, dy:0.23*H, circle(radius: 0.04*H))
        place(dx:0.88*H, dy:0.43*H, circle(radius: 0.04*H))
        place(dx:0.90*H, dy:0.73*H, circle(radius: 0.04*H))
      })
    }

    // note
    if note != false {
      place({
        place(path( // musical note
          closed: true,
          fill: color(note),
          ((0.119*H,0.211*H), (0.000*H,-0.000*H), (-0.005*H,0.001*H)),
          ((0.115*H,0.219*H), (-0.001*H,-0.007*H), (0.007*H,0.041*H)),
          ((0.125*H,0.272*H), (-0.001*H,-0.004*H), (0.002*H,0.011*H)),
          ((0.118*H,0.283*H), (0.009*H,-0.000*H), (-0.013*H,-0.000*H)),
          ((0.096*H,0.302*H), (0.000*H,-0.011*H), (0.000*H,0.007*H)),
          ((0.106*H,0.317*H), (-0.006*H,-0.003*H), (0.010*H,0.004*H)),
          ((0.134*H,0.302*H), (-0.003*H,0.011*H), (0.001*H,-0.002*H)),
          ((0.132*H,0.280*H), (0.002*H,0.010*H), (-0.006*H,-0.032*H)),
          ((0.124*H,0.232*H), (0.001*H,0.004*H), (0.000*H,-0.005*H)),
          ((0.132*H,0.227*H), (-0.008*H,-0.000*H), (0.009*H,-0.001*H)),
          ((0.148*H,0.236*H), (-0.003*H,-0.007*H), (0.002*H,0.004*H)),
          ((0.155*H,0.239*H), (-0.001*H,0.003*H), (0.001*H,-0.000*H)),
          ((0.153*H,0.229*H), (0.002*H,0.005*H), (-0.002*H,-0.009*H)),
          ((0.139*H,0.211*H), (0.007*H,0.004*H), (-0.003*H,-0.002*H)),
          ((0.119*H,0.211*H), (0.007*H,-0.002*H), (-0.005*H,0.001*H)),
        ))
        place(path( // wavy line
          closed: true,
          fill: color(note),
          ((0.235*H,0.230*H), (0.000*H,-0.000*H), (-0.001*H,0.001*H)),
          ((0.231*H,0.239*H), (0.001*H,-0.004*H), (-0.003*H,0.011*H)),
          ((0.210*H,0.240*H), (0.013*H,0.011*H), (-0.007*H,-0.006*H)),
          ((0.195*H,0.234*H), (0.006*H,-0.000*H), (-0.009*H,-0.000*H)),
          ((0.174*H,0.250*H), (0.005*H,-0.011*H), (-0.004*H,0.008*H)),
          ((0.172*H,0.265*H), (-0.003*H,-0.003*H), (0.004*H,0.003*H)),
          ((0.183*H,0.259*H), (-0.004*H,0.007*H), (0.004*H,-0.009*H)),
          ((0.194*H,0.245*H), (-0.003*H,-0.000*H), (0.002*H,-0.000*H)),
          ((0.203*H,0.251*H), (-0.003*H,-0.003*H), (0.007*H,0.006*H)),
          ((0.225*H,0.262*H), (-0.005*H,-0.000*H), (0.006*H,-0.000*H)),
          ((0.241*H,0.251*H), (-0.004*H,0.007*H), (0.004*H,-0.008*H)),
          ((0.242*H,0.230*H), (0.004*H,0.004*H), (-0.003*H,-0.002*H)),
          ((0.235*H,0.230*H), (0.003*H,-0.002*H), (-0.003*H,0.005*H)),
        ))
      })
    }

  }))
})}

#let scsnowmandefault(..args) = { // always global
  for (key,value) in args.named() {
    scsnowman-state.update(s => {
      if not key in s.keys() {
        panic("Unknown key: ", key)
      }
      s.insert(key, value)
      s
    })
  }
}

#let makeitemsnowman(body) = {
  let func1 = eval(
    "(func, " + scsnowman-init.keys().join(",") + ")=>{" +
      "func.with(" + scsnowman-init.keys().map( e => {
        e + ":" + e
      }).join(",") + ")}"
  )
  let values = scsnowman-init.values()
  let func2(func, array) = {
    if array == () { return func() }
    else {
      let value = array.remove(0)
      return func2(func.with(value), array)
    }
  }
  let scsnowman-list = func2(func1.with(scsnowman), values)
  let scsnowman-list = scsnowman-list.with(
    hat: black,
    eyes: black,
    mouth: black,
  )
  set list(marker: (
    scsnowman-list(muffler: rgb(100%,0%,0%)),
    scsnowman-list(muffler: rgb(0%,0%,100%)),
    scsnowman-list(muffler: rgb(0%,100%,0%)),
    scsnowman-list(muffler: cmyk(0%,0%,100%,0%)),
  ))
  body
}

// makeqedsnowman is not available

#let scsnowmannumeral(num, ..args) = {
  let func1 = eval(
    "(func, " + args.named().keys().join(",") + ")=>{" +
      "func.with(" + args.named().keys().map( e => {
        e + ":" + e
      }).join(",") + ")}"
  )
  let values = args.named().values()
  let func2(func, array) = {
    if array == () { return func() }
    else {
      let value = array.remove(0)
      return func2(func.with(value), array)
    }
  }
  let func = func2(func1.with(scsnowman), values)
  str(num).split("8").join(func())
}

