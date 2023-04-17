def extract_information_from_txt(file_name,file_out):
  """
  The aim of this function is to reorganize our txt file
  """


  with open(file_name,'r') as f:
    f.readline() #Skip the first line with the headers

    string_of_contents = f.read() #Here we get a whole string representing the file
    f.close()
  
  with open(file_out,'w') as f_out :
    list_of_contents = string_of_contents.split("\n")[:-1] #Here we get a list of strings where each string represents a line within the our file
    for s in list_of_contents:
        k = s.split(',')
        coordinates = list(map(lambda s : float(s),k[1:]))
        x1,y1,w,h = coordinates
        x2 = x1+w
        y2 = y1
        x3 =x2
        y3 = y2+h
        x4 = x1
        y4 = y3
        line = " ".join(list(map(lambda s : str(s),[x1,y1,x2,y2,x3,y3,x4,y4])))
        line = " ".join([k[0],line])
        f_out.write(line+"\n")
   
    f.close()

import os
cwd = os.getcwd()
for animal in ["Cheetah","Cygne","Jellyfish","Lions","SeaTurtle","Butterfly","Bird","Bear"]:
    extract_information_from_txt(cwd+"/"+animal+"/coords_"+animal+".txt",cwd+"/annotations/"+animal+".ann") 