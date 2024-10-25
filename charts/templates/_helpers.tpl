
{{- define "go-echo9607dc74-b3d4-4bb1-a18e-bb2dae8756de.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9607dc74-b3d4-4bb1-a18e-bb2dae8756de.fullname" -}}
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


{{- define "go-echo9607dc74-b3d4-4bb1-a18e-bb2dae8756de.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9607dc74-b3d4-4bb1-a18e-bb2dae8756de.labels" -}}
helm.sh/chart: {{ include "go-echo9607dc74-b3d4-4bb1-a18e-bb2dae8756de.chart" . }}
{{ include "go-echo9607dc74-b3d4-4bb1-a18e-bb2dae8756de.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9607dc74-b3d4-4bb1-a18e-bb2dae8756de.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9607dc74-b3d4-4bb1-a18e-bb2dae8756de.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}