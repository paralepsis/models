/* four clips */
if (0) { linear_extrude(height=1) polygon(points=[[10,32],[10,245],[104,245],[104,290],[198,290],[198,245],
                [301,245],[301,29],[224,29],[224,0],[89,0],[89,32]]);
}

/* two clips */
if (0) linear_extrude(height=1) polygon(points=[[10,32],[10,290],[198,290],[198,245],
                [301,245],[301,0],[89,0],[89,32]]);

/* two clips, longer fan arm */
linear_extrude(height=1) polygon(points=[[5,43],[5,290],[198,290],[198,245],
                [301,245],[301,0],[89,0],[89,43]]);
