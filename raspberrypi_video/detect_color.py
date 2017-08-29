# import the necessary packages
import numpy as np
import argparse
import cv2
 
# construct the argument parse and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", help = "snap1.jpg")
args = vars(ap.parse_args())
 
# load the image
image = cv2.imread(args["image"])

# define the list of boundaries
boundaries = [
	([0, 0, 1], [94, 47, 250]),
	([0, 0, 1], [5, 209, 236])
	#([25, 146, 190], [62, 174, 250]),
	#([103, 86, 65], [145, 133, 128])
        ]

color = ["red","yellow"]

number = 0


# loop over the boundaries
for (lower, upper) in boundaries:
	# create NumPy arrays from the boundaries
	lower = np.array(lower, dtype = "uint8")
	upper = np.array(upper, dtype = "uint8")

	dst = cv2.inRange(image, lower, upper)
        no_red = cv2.countNonZero(dst)
        print('The number of '+ color[number] +' ' + 'pixels is: ' + str(no_red))
        print('In percentage is: ' + str((float(no_red)/172800)*100) + '%')
 
	# find the colors within the specified boundaries and apply
	# the mask
	mask = cv2.inRange(image, lower, upper)
	output = cv2.bitwise_and(image, image, mask = mask)

        number+=1
 
	# show the images
	cv2.imshow("Heat Calculation", np.hstack([image, output]))
	cv2.waitKey(0)

	
