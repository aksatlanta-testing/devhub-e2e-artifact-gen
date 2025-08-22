
{{- define "go-echoc323f999-48ae-4320-b1c1-eff9c3d4483b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc323f999-48ae-4320-b1c1-eff9c3d4483b.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoc323f999-48ae-4320-b1c1-eff9c3d4483b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc323f999-48ae-4320-b1c1-eff9c3d4483b.labels" -}}
helm.sh/chart: {{ include "go-echoc323f999-48ae-4320-b1c1-eff9c3d4483b.chart" . }}
{{ include "go-echoc323f999-48ae-4320-b1c1-eff9c3d4483b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc323f999-48ae-4320-b1c1-eff9c3d4483b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc323f999-48ae-4320-b1c1-eff9c3d4483b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}