import music21 as m21
import os

def gen_score(f):
    xml = open(f).read()
    used_notes = set()

    xml_data = m21.converter.parse(xml)
    score = []

    tie_len = 0

    for part in xml_data.parts:
        for note in part.recurse().notesAndRests:
            duration = int(note.quarterLength * 16)
            name = "S" if note.isRest else note.nameWithOctave.replace("-", "f").replace("#", "s")

            if note.tie is not None:
                if note.tie.type == "start":
                    tie_len += duration
                elif note.tie.type == "stop":
                    score.append((duration + tie_len, name))
                    tie_len = 0
            else:
                score.append((duration, name))

            if not note.isRest:
                freq = round(m21.pitch.Pitch(note.nameWithOctave).freq440)
                used_notes.add((note.nameWithOctave.replace("-", "f").replace("#", "s"), freq))

    print(score)
    print(used_notes)

    times = []
    for i, (dur, tone) in enumerate(score):
        times += [tone] * (dur-1)
        # times += ["S"]
        if i != len(score) - 1 and tone == score[i+1][1]:
            times += ["S"]
        else:
            times += [tone]


    lines = []
    print(len(times))

    for i in range(0, len(times), 4):
        # if "R" in f:
        #     lines.append(f"12'd{i}: toneR = `{times[i]}; 12'd{i+1}: toneR = `{times[i+1]}; 12'd{i+2}: toneR = `{times[i+2]}; 12'd{i+3}: toneR = `{times[i+3]};")
        # else:
        #     lines.append(f"12'd{i}: toneL = `{times[i]}; 12'd{i+1}: toneL = `{times[i+1]}; 12'd{i+2}: toneL = `{times[i+2]}; 12'd{i+3}: toneL = `{times[i+3]};")
        lines.append(f"12'd{i}: tone = `{times[i]}; 12'd{i+1}: tone = `{times[i+1]}; 12'd{i+2}: tone = `{times[i+2]}; 12'd{i+3}: tone = `{times[i+3]};")

    open(f + ".out.v", "w").write("\t\t\t\t" + "\n\t\t\t\t".join(lines) + "\n")
    return used_notes


used_notes = set()

for f in os.listdir():
    if not f.endswith(".musicxml"):
        continue
    
    u = gen_score(f)
    used_notes = used_notes.union(u)

lines = []
for tone, freq in used_notes:
    lines.append(f"`define {tone} 32'd{freq}")
open("tones.v", "w").write("\n".join(lines) + "\n")

types = [[], [], [], [], [], [], []]
for tone, freq in used_notes:
    types[ord(tone[0]) - ord("A")].append(tone)

for t in types:
    print("`" + ", `".join(t))

for tone, freq in used_notes:
    if "f" in tone:
        print("`" + tone, end=", ")

    