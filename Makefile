generate:
	tuist fetch
	TUIST_DEV=1 tuist generate

genrate_with_no_lint
    tuist fetch
    TUIST_DEV=0 tuist generate

clean:
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

reset:
	tuist clean
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

feature:
	python3 Scripts/generate_new_feature.py
