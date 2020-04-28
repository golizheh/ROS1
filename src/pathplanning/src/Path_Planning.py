#!/usr/bin/env python
import rospy
from std_msgs.msg import String
import sys
import requests

class locations:
  def __init__(self, lat,lon):
     self.lat=lat
     self.lon=lon
     
      

def callback(data):
     
    data_=data.data.split(",")
    url="http://localhost:5000/route?source%5Blat%5D="+data_[0]+"&source%5Blng%5D="+data_[1]+"&target%5Blat%5D="+data_[2]+"&target%5Blng%5D="+data_[3]
    print(url)
    r = requests.get(url)
    my_data=r.json()
    path= my_data['path']
    i=0
    locations_list=[]
    #f= open("Data.txt","w+")
    while (i <len(path[1])):
        t=path[1][i]
        location=locations(str(t[4]),str(t[5]))
        locations_list.append(location) 
        print(len(locations_list))
        #f.write(str(t[4])+","+str(t[5])+"\n")
        i=i+1
    #f.close()
    #print(my_data['path'])
    #print (r.json())
    #rospy.loginfo(rospy.get_caller_id() + " %s", data.data)
    
def Path_planning():

    #print("inside the code")
    
    rospy.init_node('Path_planning', anonymous=True)
    #print("Hello after ROS py...")
    rospy.Subscriber("string_url", String, callback)

    
    rospy.spin()

if __name__ == '__main__':
    #print("Hello from python")
    Path_planning()

