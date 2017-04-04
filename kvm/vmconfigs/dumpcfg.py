f=open('vmlist')
lines= f.readlines()
fo=open('xmlcfg', 'w')
for l in lines:
	fo.write('virsh dumpxml %s > %s.xml\n' % (l.strip('\n'), l.strip('\n'))) 
fo.close()
